#!/usr/bin/env bash
set -uo pipefail
cd "$(dirname "$0")/.."

log() { echo "[docs-start] $*"; }

default_branch=main
dependency_inputs=(package-lock.json .cursor/install.sh)

on_default_branch() { [ "$(git symbolic-ref --short -q HEAD)" = "$default_branch" ]; }

fast_forward_default_branch() {
  local before after
  before="$(git rev-parse --short "$default_branch" 2>/dev/null)" || return 1
  if on_default_branch; then
    git fetch -q origin "$default_branch" 2>/dev/null && git merge -q --ff-only FETCH_HEAD >/dev/null 2>&1
  else
    git fetch -q origin "$default_branch:$default_branch" 2>/dev/null
  fi || return 1
  after="$(git rev-parse --short "$default_branch")"
  if [ "$before" = "$after" ]; then
    log "$default_branch is current at $after"
    return 0
  fi
  log "$default_branch fast-forwarded from $before to $after"
  git diff --quiet "$before" "$after" -- "${dependency_inputs[@]}" && return 0
  if on_default_branch; then
    log "a dependency input changed since the snapshot; running bash .cursor/install.sh"
    if bash .cursor/install.sh >/dev/null 2>&1; then
      log "bash .cursor/install.sh succeeded"
    else
      log "bash .cursor/install.sh failed; dependencies may still match $before"
    fi
  else
    log "a dependency input changed since the snapshot; run bash .cursor/install.sh after checking out your branch"
  fi
}

fast_forward_default_branch || log "could not fast-forward $default_branch to origin/$default_branch; the code may lag $default_branch until the next environment build"

exit 0
