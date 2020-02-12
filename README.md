# Gutenbuild Github Action

A containerized `@wordpress/scripts` that runs as a GitHub Action.

## Scenario

You used `npm init @wordpress/block premium-content` to start up a new WordPress Gutenberg block because you are awesome (and I love you).

You're one `npx wp-scripts start` away from Webpack watching your filesystem and transpiling your ES6 hotness into:

```
- build/index.assets.php
- build/index.js
```

But you're an opinionated developer. You don't want to commit build artifacts to you source control!

That's where `gutenbuild` comes in. It's your `wp-scripts` in the cloud.

## Example

In this repository there is a folder named `example`:

```
find ./example
./example
./example/example-plugin.php
./example/src
./example/src/index.js
```

The Plugin `example-plugin.php` `require_once()`'s the './example/build/index.asset.php` that `wp-scripts` builds for us.

Use hte `beaucollins/gutenbuild` action in a GitHub workflow to build it for you in the cloud:

```yml
on: [push]

jobs:
    build:
        runs-on: ubuntu-latest
        name: Gutenbuild

        steps:
        - uses: actions/checkout@v2

        - uses: beaucollins/gutenbuild@master
          with:
            src: 'example/src'
            output_path: 'example/build'

        - uses: actions/upload-artifact@v1
          with:
            name: 'build'
            path: 'example/build'

```

In this example, the results are uploaded as artifacts. In a differnt project we do this prior to kicking of a `PHPUnit` based test suite that requires these files to be present.

