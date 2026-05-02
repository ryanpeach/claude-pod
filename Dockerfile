FROM node:lts-slim

# git/curl/less are baseline dev tools; jq and gh are reached for by Claude's built-in workflows
# (JSON pipelines and the GitHub CLI for PRs/issues/releases). ca-certificates is needed for HTTPS.
RUN apt-get update \
 && apt-get install -y --no-install-recommends git ca-certificates curl less jq gh \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

# Run as non-root so a process inside the container can't write to system paths even if it tries.
USER node

CMD ["bash"]
