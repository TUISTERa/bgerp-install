# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

The `bgerp-install` repository contains installation scripts and Docker configurations for [bgERP](https://bgerp.com), a web-based business process management system. This repository focuses specifically on deployment and installation tooling, while the main application code resides in the `bgerp` repository.

## Development Commands

### Standard Installation
```bash
# Clone the repository
git clone https://github.com/bgerp/bgerp-install.git

# Run the installation script (as root or with sudo)
sudo ./install_bgERP_php7.sh -d=/var/www -u=bgerp.local -b=DC2 -s=bgerpuser -n=bgerpbase

# Installation parameters are saved to:
/root/bgerp-install.info
```

### Docker Installation
```bash
# Build the Docker image
./docker/build.sh

# Start the containers
cd docker && docker-compose up -d

# Access the application at:
http://localhost:8080
```

## Code Architecture

### Repository Structure

```
bgerp-install/
├── install_bgERP_php7.sh    # Main installation script
└── docker/                  # Docker-based installation
    ├── build.sh            # Docker image build script
    ├── docker-compose.yml  # Multi-container definition
    └── mount/             # Docker volume mount point
```

### Installation Script Architecture

The `install_bgERP_php7.sh` script follows these key architectural patterns:

1. **Command-line Parameter Handling**
   - Supports installation customization via command-line arguments
   - Handles essential parameters like installation directory, database credentials, and version branch

2. **System Requirements Validation**
   - Validates Ubuntu version compatibility (22.04, 24.04)
   - Checks for required system packages
   - Verifies system user permissions

3. **Database Configuration**
   - Sets up MySQL/MariaDB
   - Creates database and user with appropriate permissions
   - Handles password generation and storage

### Docker Configuration Architecture

The Docker setup uses a multi-container architecture:

1. **Application Container (`erp`)**
   - Based on the custom bgERP image
   - Mounts persistent storage for customizations
   - Configurable via environment variables

2. **Database Container (`db`)**
   - Uses MariaDB 10.4
   - Persistent volume for database storage
   - Preconfigured for bgERP requirements

3. **Networking**
   - Custom network 'erp' for container isolation
   - Port mappings for web (8080) and database (3307) access

## Development Guidelines

### Installation Script Development

1. **Parameter Additions**
   - Add new parameters in the getopts section
   - Update usage information in help output
   - Maintain backward compatibility

2. **System Compatibility**
   - Test against all supported Ubuntu versions
   - Verify package availability in target distributions
   - Document version-specific requirements

### Docker Development

1. **Image Building**
   - Keep base image up to date
   - Minimize image layers
   - Follow Docker best practices for security

2. **Configuration**
   - Use environment variables for configuration
   - Maintain default values in docker-compose.yml
   - Document all configurable parameters