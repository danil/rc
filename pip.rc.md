# pip

Python packages management system

## List

    pip list

## Install

    pip install --user git+git://example.xyz/your/repository.git@stable-1.2.3
    pip install --user "your_package_name>=1.2.3,<3.2.1"

## Uninstall

    pip uninstall your-package-name

## requirements.txt

<https://pip.readthedocs.org/en/1.1/requirements.html#requirements-file-format>

### Install

    pip install --user --requirement ~/requirements.txt

### Upgrade

    pip install --user --upgrade --requirement ~/requirements.txt

### Uninstall

    pip uninstall --yes --requirement ~/requirements.txt
