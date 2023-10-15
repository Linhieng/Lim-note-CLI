# NPM 的使用

## `--` 参数说明

在 `package.json` 中有以下脚本：

```json
"scripts": {
    "test:unit": "vue-cli-service test:unit",
},
```

执行 `npm run test:unit -- --coverage` 命令时，`--` 的作用就是告诉 npm 后面的参数 `--coverage` 是给脚本中的命令的，而不是给 `npm` 你的。效果就是 `npx vue-cli-service test:unit --coverage`

## 发布包相关

```sh
$ npm login
# 登录

$ npm publish --access public
# 发布公共包

$ npm unpublish <package-name>@<version>
# 取消某个包的发布，比如 npm unpublish @linhieng/camelcase@0.0.3
```
