# npm

Node package manager

## Path to executeable

    npx bower install pkg-nm

## Search

    npm search pkg-nm

## Install

    npm install pkg-nm

## List outdated

    npm outdated

## Update

    npm update pkg-nm

## Update all

    npm update

## Uninstall

    npm uninstall pkg-nm

## List

List all dependencies tree

    npm ls

## Shrinkwrap

<https://docs.npmjs.com/cli/shrinkwrap>

Fix nested dependencies versions `npm-shrinkwrap.json`

```json
{
  "name": "A",
  "version": "1.1.0",
  "dependencies": {
    "B": {
      "version": "1.0.1",
      "from": "B@^1.0.0",
      "resolved": "https://registry.npmjs.org/B/-/B-1.0.1.tgz",
      "dependencies": {
        "C": {
          "version": "1.0.1",
          "from": "org/C#v1.0.1",
          "resolved": "git://github.com/org/C.git#5c380ae319fc4efe9e7f2d9c78b0faa588fd99b4"
        }
      }
    }
  }
}
```
