from strands import Agent, tool
from strands_tools import http_request
from strands.models.ollama import OllamaModel

ollama_model = OllamaModel(
    host="http://localhost:11434",
    model_id="llama3.2:3b"
)

SYSTEM_PROMPT = """
You are a helpful assistant that provides real-time information based on user queries. You have access to a tool that allows you to make HTTP requests to fetch the latest data from the web. Use this tool whenever you need to retrieve up-to-date information to answer user questions accurately.
eg if some one ask and you dont have infomation about that then you can use tool to fetch real time data and then answer the question.
"""

strands_agent = Agent(
    model=ollama_model,
    tools=[http_request],
    system_prompt=SYSTEM_PROMPT,
    callback_handler=None,
    
)


def fetch_real_time_data(query: str):
    return strands_agent(query)
    


