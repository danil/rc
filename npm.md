# npm

Node package manager

## Path to executeable

    `npm bin`/bower install package-name

## Search

    npm search package-name

## Install

    npm install package-name

## Update

    npm update package-name

## ls

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
