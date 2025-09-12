# 快速开始

Qwen（通义千问）的API使用和OpenAI API适配的API格式，这也意味着，开发者只需修改key和base url即可使用阿里云提供的Qwen模型服务，可以使用OpenAI SDK以及轻松使用OpenAI API兼容的服务。Qwen API的chat completion服务能够接收prompt输入并输出文本回复，可应用于问答、对话、创作、翻译、摘要、代码辅助等应用场景中。本文档旨在帮助用户快速开始使用Qwen API，其中包括：

* 注册账号及开通服务
* 配置环境，其中包括Python、curl等
* 如何使用API

## 开通服务并创建API-KEY

首先，[注册阿里云账号](https://account.aliyun.com/register/register.htm)，并完成账号[实名认证](https://account.console.aliyun.com/v2/?spm=a2c4g.324614.0.0.1158db8808Oi7x#/authc/home)

登录[DashScope控制台](https://dashscope.console.aliyun.com)，开通服务

![image](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/8oLl9yvaz6oMlapY/img/84d03a5e-e8be-4e5c-a53a-868346873718.png)

导航到[API-KEY页面](https://dashscope.console.aliyun.com/apiKey)并创建新的API-KEY。


## 环境配置

我们可以使用Python、curl等访问Qwen API。下面我们将简单说明如何配置基本环境。

### Python

<p style="margin-top: 12px;">
<details>
<summary>
  <strong>安装Python</strong> 
</summary>
<p style="margin-top: 12px;">
您需要安装Python才能通过Python访问Qwen API。如您不了解Python，建议您访问[官网](https://www.python.org)了解如何使用。建议您打开终端或命令行检查是否能够使用Python：

* **MacOS**: 建议安装iTerm并打开iTerm
* **Windows**: 在开始菜单搜索 `cmd` 打开命令行窗口

输入 `python` 并点击回车即可通过判断是否进入Python确认是否安装成功。如出现"Error: command python not found"，即Python尚未安装成功。我们建议您安装3.7及以上的Python版本。

我们建议您使用虚拟环境来进行Python的相关配置，并推荐使用anaconda。建议访问[Anaconda官网](https://www.anaconda.com/)了解如何下载和使用。
</p>
</details>
</p>

<p style="margin-top: 12px;">
<details>
<summary>
  <strong>安装OpenAI Python库</strong> 
</summary>
<p style="margin-top: 12px;">
在确保您的环境上已经预装Python环境（>=3.7.1）后，请安装OpenAI Python库，运行：

```bash
pip install openai --upgrade
```

运行完此命令后，可以通过继续运行 `pip list` 命令来查看 `openai` 是否安装成功以及安装的版本。
</p>
</details>
</p>

### curl

<p style="margin-top: 12px;">
<details>
<summary>
  <strong>安装curl</strong> 
</summary>
<p style="margin-top: 12px;">

大部分操作系统均配置了curl，如需检查是否能正常使用curl，可打开命令行窗口（MacOS打开iTerm，Windows在开始菜单搜索 `cmd` ）并运行如下命令：

```bash
curl https://dashscope.aliyun.com/
```

发送HTTP请求后将获取到网页内容。如果返回报错，请访问[官网](https://everything.curl.dev/get)并按照官网要求安装。

</p>
</details>
</p>



## 配置API Key
在[API-KEY页面](https://dashscope.console.aliyun.com/apiKey)中找到此前创建好的API Key。配置好API Key后，Python便能检测到它并在项目中使用它。下面分别说明如何在MacOS和Windows上配置。

<p style="margin-top: 12px;">
<details>
<summary><strong>MacOS</strong></summary>
<p style="margin-top: 12px;">

1. **打开终端**: 打开iTerm，如找不到iTerm可通过点击 `Command+Space` 搜索

2. **编辑Bash Profile**: 使用 `nano ~/.bash_profile` 或者 `nano ~/.zshrc` （如您使用zsh或使用较新的MacOS版本）打开profile文件

3. **新增环境变量**: 请在profile文件中，新增下列命令，并将 `your-api-key-here` 替换成你实际使用的API Key

```bash
export DASHSCOPE_API_KEY='your-api-key-here'
```

1. **保存并退出**: 点击 `Ctrl+O` 保存更改内容，并点击 `Ctrl+O` 关闭编辑器

2. **载入Profile**: 使用命令 `source ~/.bash_profile` 或 `source ~/.zshrc`载入更新后的Profile

3. **验证**: 可通过运行命令 `echo $DASHSCOPE_API_KEY` 检查是否配置成功。如配置成功，终端将显示你的API Key

</p>
</details>
</p>

<p style="margin-top: 12px;">
<details>
<summary><strong>Windows</strong></summary>
<p style="margin-top: 12px;">

1. **打开终端**: 在开始菜单中输入 `cmd` 搜索

2. **设置环境变量**: 可以通过运行如下命令为当前会话通过设置环境变量的方式配置API Key

```bash
setx DASHSCOPE_API_KEY 'your-api-key-here'
```

1. **永久配置**: 建议将这个环境变量配置到系统属性中，操作示例如下：

  * 右击 `此电脑` 或者 `我的电脑` 并选择 `属性`
  * 点击 `高级系统设置`
  * 点击 `环境变量`
  * 在 `系统变量` 部分，点击 `新建...`，并输入 `DASHSCOPE_API_KEY` 作为变量名，以及您的API Key作为变量值

2. **验证**: 可打开命令行窗口，运行命令 `echo %DASHSCOPE_API_KEY%` 检查是否配置成功。如配置成功，终端将显示你的API Key

</p>
</details>
</p>


## 发送API请求

下文介绍如何在Python和curl中使用Qwen API。首先，请查看模型列表，选择您希望使用的模型的id，并在命令中传入 `model` 参数。在本示例中，我们使用 `qwen-plus` 。


### Python

完成上述配置工作后，您即可使用Python向Qwen API发送请求。您可以在IPython或者Jupyter Notebook中运行下列命令，您也可以新建一个 `dashscope-test.py` 文件并粘贴下列代码进入其中。

``` python
from openai import OpenAI
import os

client = OpenAI(
    api_key=os.getenv("DASHSCOPE_API_KEY"),
    base_url="https://dashscope.aliyuncs.com/compatible-mode/v1",
)

completion = client.chat.completions.create(
    model="qwen-plus",
    messages=[
      {'role': 'system', 'content': 'You are a helpful assistant.'},
      {'role': 'user', 'content': '你好！'}
    ]
)

print(completion.choices[0].message)
```

如使用 `dashscope-test.py` 文件，您可在终端中运行命令 `python dashscope-test.py` 。运行正常，终端将返回类似如下内容：

```
ChatCompletionMessage(content='你好！很高兴为你提供帮助。', role='assistant', function_call=None, tool_calls=None)
```

这是Qwen API的Chat Completion的最简单用法，如需了解更多细节，如流式输出、function call等，请继续阅读本文档。

### curl

完成环境配置后，您可在终端运行如下命令测试是否能成功向Qwen API发送请求。

```bash
curl --location 'https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions' \
  --header "Authorization: Bearer $DASHSCOPE_API_KEY" \
  --header 'Content-Type: application/json' \
  --data '{
    "model": "qwen-plus",
    "messages": [
      {
        "role": "system",
        "content": "You are a helpful assistant."
      },
      {
        "role": "user",
        "content": "你是谁？"
      }
    ]
  }'
```

如发送成功，终端将返回类似如下结果：

```json
{"choices":[{"message":{"role":"assistant","content":"我是通义千问，由阿里云开发的人工智能助手。我被设计用来回答各种问题、提供信息和与用户进行对话。有什么我可以帮助你的吗？"},"finish_reason":"stop","index":0,"logprobs":null}],"object":"chat.completion","usage":{"prompt_tokens":22,"completion_tokens":37,"total_tokens":59},"created":1722162849,"system_fingerprint":null,"model":"qwen-plus","id":"chatcmpl-6b7e166c-dbb6-92fc-91e5-003a5d6a3b77"}
```

## 下一步

如您已经完成上述步骤，恭喜您成功使用Qwen API。如果想了解更多用法，欢迎阅读其他章节！