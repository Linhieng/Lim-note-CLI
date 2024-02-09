# package.json 配置

## `scripts`

通过 `set ENV_VAR=VAR` 可以设置环境变量，但要注意空格问题，比如下面代码：

```json
{
    "scripts": {
        "serve": "set TYPE=demo && vue-cli-service serve",
    }
}
```

由于 `demo &&` 之间有空格，所以最终的变量也会有一个空格。通过打印 `process.env.TYPE` 就会发现有空格。

此外，具体如何设置环境变量取决于 shell，比如 Window 系统中的 vscode 默认使用 powshell 终端，所以需要通过 `set` 关键字设置环境变量，但苹果系统中就不需要 `set` 命令。

`scripts` 字段中的 `key` 是[生命周期事件](https://docs.npmjs.com/cli/v10/using-npm/scripts#life-cycle-operation-order)，`value` 是在该声明周期运行的命令。所以某些 key，比如 `install`, `prepare` 都是特殊的生命周期节点

## `exports`

我们的包文件可能被别人通过 CommonJS 或 ES 两种方式导入，通过 `exports` 配置项可以指定这两种方式导入时会导入哪一个文件，下面是一个示例：

```json
  "exports": {
    ".": {
      "types": "./dist/index.d.ts",
      "import": "./dist/index.mjs",
      "require": "./dist/index.js"
    }
  },
```

上面示例中，还添加了 `types` 项，相关讨论可参见 [TypeScript#52363](https://github.com/microsoft/TypeScript/issues/52363)
