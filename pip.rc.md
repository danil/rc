# pip

Python packages management system

## List

    pip list

## Search

`pip search` currently disabled https://github.com/pypa/pip/issues/5216#issuecomment-744605466
use https://pypi.org

## Show version

    pip show your-pkg-name

## Install

    pip install --user git+git://your.tld/your/repository.git@stable-1.2.3
    pip install --user "your_pkg_name>=1.2.3,<3.2.1"

## Uninstall

    pip uninstall your-pkg-name

## requirements.txt

<https://pip.readthedocs.org/en/1.1/requirements.html#requirements-file-format>

### Install

    pip install --user --requirement ~/requirements.txt

### Upgrade

    pip install --user --upgrade --requirement ~/requirements.txt

### Uninstall

    pip uninstall --yes --requirement ~/requirements.txt
