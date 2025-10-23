# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 2025-10-23

### Changed
- Added n8n environment variables to fix deprecation warnings
  - `OFFLOAD_MANUAL_EXECUTIONS_TO_WORKERS=true` for worker execution offloading
  - `N8N_BLOCK_ENV_ACCESS_IN_NODE=false` to maintain env access in Code nodes
  - `N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true` for automatic permission fixes

## 2025-10-14
