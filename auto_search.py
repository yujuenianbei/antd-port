from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

# 设置Chrome选项
options = webdriver.ChromeOptions()
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")
options.add_argument("--headless") # 无头模式，不显示浏览器窗口
# 不再手动指定binary_location，让webdriver-manager处理

# 自动下载并设置ChromeDriver
service = Service(ChromeDriverManager().install())

# 初始化WebDriver
driver = webdriver.Chrome(service=service, options=options)

try:
    # 1. 打开百度
    print("正在打开百度...")
    driver.get("https://www.baidu.com")
    time.sleep(2) # 等待页面加载

    # 2. 找到搜索框
    search_box = driver.find_element(By.ID, "kw")
    print("找到搜索框。")

    # 3. 输入搜索关键词“人工智能”
    search_query = "人工智能"
    print(f"正在输入搜索词: {search_query}")
    search_box.send_keys(search_query)

    # 4. 提交搜索 (按回车键)
    print("提交搜索...")
    search_box.send_keys(Keys.RETURN)

    # 5. 等待结果页面加载
    time.sleep(5)
    print("搜索完成，页面已加载。")

    # (可选) 打印页面标题
    print(f"页面标题: {driver.title}")

finally:
    # 6. 关闭浏览器
    print("关闭浏览器...")
    driver.quit()