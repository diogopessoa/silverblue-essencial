# silverblue-essencial   [![bluebuild build badge](https://github.com/diogopessoa/silverblue-essencial/actions/workflows/build.yml/badge.svg)](https://github.com/diogopessoa/silverblue-essencial/actions/workflows/build.yml)

Silverblue-essential is a Fedora Silverblue image with essential apps/flatpaks from **Flathub**, **Office fonts**, a unique **Hatter icon theme** faithful to the application's identity and color scheme, and **RPM-OSTree Manager** — a CLI program for managing RPM packages, rollbacks, and deployments via `rpm-ostree`.

## Installation

> [!WARNING]
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

First rebase to the unsigned image to install signing keys and policies:

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/diogopessoa/silverblue-essencial:latest
```

Reboot to complete the rebase:

```
systemctl reboot
```

Then rebase to the signed image:

```
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/diogopessoa/silverblue-essencial:latest
```

Reboot again to complete the installation:

```
systemctl reboot
```

The `latest` tag always points to the newest build while still using the Fedora version specified in `recipe.yml`, preventing accidental upgrades to the next major Fedora release.

## ISO available for download

The link to the pre-compiled ISO image is in [Releases](https://github.com/diogopessoa/silverblue-essencial/releases). It cannot be distributed directly on GitHub due to its size (4.8 GB).

## Generate the ISO with BlueBuild

If you are using Fedora Atomic (Silverblue, Kinoite, Bluefin, etc.), you can generate the ISO locally using the BlueBuild CLI.

### Install BlueBuild

The easiest way is to use the official installer script:

```bash
bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)
```

The installer will place the `bluebuild` binary in:

```
/usr/local/bin/bluebuild
```

You may be prompted for your sudo password.

### Generate the ISO

After installing BlueBuild, run:

```bash
sudo bluebuild generate-iso \
  --iso-name silverblue-essencial.iso \
  image ghcr.io/diogopessoa/silverblue-essencial:latest
```

This command will:

1. download the OCI image from the registry
2. generate the OSTree deployment
3. build a bootable ISO installer

The ISO will be created in the current directory.

To see all available options:

```
bluebuild --help
```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign).

You can verify the container image signature by downloading the `cosign.pub` file from this repository and running:

```bash
cosign verify --key cosign.pub ghcr.io/diogopessoa/silverblue-essencial
```

## Script Fedora Silverblue Post-Install (alternative)

This [Script](https://gist.github.com/diogopessoa/d66ec201068ac799da7a25f996be5cfe) is an alternative for installing essential applications and applying configuration adjustments after completing a standard Fedora Silverblue installation.

## Credits
- [BlueBuild docs](https://blue-build.org/how-to/setup/) see for quick setup instructions for setting up your own repository.
- [Fedora Linux](https://fedoraproject.org/)
