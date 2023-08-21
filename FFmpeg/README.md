[FFmpeg](https://ffmpeg.org/about.html) 包含以下三个命令工具
- `ffmpeg` 用于处理多媒体资源
- `ffprobe` 用于分析多媒体相关信息
- `ffplay` 用于播放多媒体。没用过

## 🍕 案例

### 获取音频总时长

`ffprobe -show_entries format=duration input.mp3`

```js
const process = require("child_process")

const ffmpeg_tool = 'ffprobe'
const option_list = [
    '-v error',
    '-select_streams a:0',
    '-show_entries format=duration',
    '-of default=nw=1:nk=1'
]
const options = option_list.reduce((prev, cur) => `${prev} ${cur}`, '')
const input_url = 'input.mp3'
process.exec(`${ffmpeg_tool} ${options} ${input_url}`, (error, stdout, stderr) => {
    if (!error) {
        console.log(`音频总时长为（秒）：${stdout}`)

        if (stderr) { console.log('⚠️: ', stderr) }
    } else {
        console.log('❌：', error)
    }
})
```

## 🍕 消息输出

- `-loglevel`（简写为 `-v`）。终端输出只有两种 —— 标准输出和标准错误输出。这很明显是不够用的。所以 FFmpeg 有自己的一套消息级别，不必要的消息会被输出到标准错误输出中。也就是说，标准错误输出的内容不一定是报错信息。下面是常见的级别，可以是关键字，也可以是数字，数字是从 -8 开始，依次递增 8。
&emsp;&emsp;`quiet` / `-8` 不输出任何多余信息。即只会输出“标准输出”。
&emsp;&emsp;`panic` / `0` 目前没有用处。
&emsp;&emsp;`fatal` / `8` 只显示致命错误信息，这意味着程序无法继续执行。
&emsp;&emsp;`error` / `16` 显示所有报错。推荐设置为这个。
&emsp;&emsp;`warning` / `24` 显示所有警告信息。众所周知，警告不影响程序执行。
&emsp;&emsp;`info` / `32` 这是默认值，会输出很多信息，包括 ffmpeg 的版本，输入资源的相关信息等等。
&emsp;&emsp;此外还有 `verbose`/`40`, `debug`/`48`, `trace`/`56`。
&emsp;&emsp;一般使用 `-v error`

- `-hide_banner`。默认情况下， FFmpeg 会输出其版权、版本、配置、依赖包相关信息，这些称为 banner。banner 属于 info 级别。如果已经配置`-v error`，则不需要在配置该选项。

## 🍕 `ffprobe`

### 语法

```sh
ffprobe [options] <input_url>
```

### Stream specifiers

命令语法中有关 stream_specifier 都是用于指定流的。常见的格式有下面几种：
- `<stream_index>`
&emsp;&emsp;流的索引值。通过 `-show_entries stream=index` 可以查看不同流的索引值。
- `<stream_type>[:<additional_stream_specifier>]`
&emsp;&emsp;`<stream_type>` 可选值有：`v`视频流，`a`音频流，`s`字幕流，`d`数据，`t`附件。
&emsp;&emsp;如果只声明 `<stream_type>`，则表示匹配该类型的所有流。比如 `s` 表示选择所有字幕流。
&emsp;&emsp;可以在冒号 `:` 后面指定更具体的流，比如 `s:0` 表示选择第一个字幕流，`a:0` 表示第一个音频流。（注意后面的数字不是流的索引值）

stream_specifier 通常和其他配置项一起使用，比如 `-select_streams`。下面是一些案例：
- `-select_streams 0` 选择索引值为 `0` 的流。如果是视频，那么第一个流一般是视频流
- `-select_streams a:0` 选择第一个音频流。

### 常见选项

- `-select_streams <stream_specifier>` 选择指定流。

- `-of <writer_name>[=writer_options]`。`-of` 是 `-print_format` 的简写。
&emsp;&emsp;`<writer_name>` 可选值有：`default`, `compact`, `csv`, `flat`, `ini`, `json`, `xml`。
&emsp;&emsp;目前只用到 `default`

- `-of default=<writer_options>` 用于指定默认的信息输出格式。有下面两个配置项：
    - `noprint_wrappers`（简写为 `nw`）。值为 1 时不输出 section header 和 section footer。
    - `nokey`（简写为 `nk`）。值为 1 时不输出 key。
    - 使用案例：`-of default=nw=1:nk=1`
    - 举例说明：默认输出的信息格式是下面这样的：
    ```
    [SECTION]
    key1=val1
    ...
    keyN=valN
    [/SECTION]
    ```
    设置 `-of default=nw=1` 时不输出 `[SECTION]` 和 `[/SECTION]`
    设置 `-of default=nk=1` 时不输出 `key1`, ..., `keyN`

- section。常见的 `[SECTION]` 有 `[STREAM]`, `[FORMAT]`
    - `[STREAM]` 流相关信息。常见的信息有：
        - `index` 流的索引值。因为资源中一般有多种类型流，比如视频流、音频流、字幕流。每个类型又可能有多个流。流的索引就是用来指定这些流的。
        - `codec_type` 流类型，比如 `video`, `audio`, `subtitle`。
        - `channels` 声道数量。
        - `width`, `height`, `coded_width`, `coded_height` 视频的宽高。
    - `[FORMAT]` 资源的基本信息，常用的信息有：
        - `duration` 时长，比如视频或音频总时长。
        - `filename` 文件名。
        - `format` 资源的格式，如 mp3, mp4 等。
        - `size` 资源大小，单位字节。

- 查看 section
    - `-show_entries <section_entries>` 指定要显示的 section 项。这是最常用的。
        - `<section_entries>` 的常用语法为：`<section1>=<key1>,<keyN>:<section2>=<key1>,<key2>`，下面是一些使用案例：
        - `-show_entries format` 等同于 `-show_format`
        - `-show_entries format=filename` 查看 `[FORMAT]` 中的 `filename`。
        - `-show_entries format=filename,size` 查看 `[FORMAT]` 中的 `filename` 和 `size`
        - `-show_entries format=size:stream=index`
    - `-show_streams` 查看 `[STREAM]`。
    - `-show_format` 查看 `[FORMAT]`。
    - `-show_error` 查看 `[ERROR]`（如果有的话）。
    - 此外还有 `-show_data`, `-show_data_hash <algorithm>`, `-show_packets`, `-show_frames`, `-show_log <loglevel>`, `-show_programs`, `-show_chapters` 等等。
