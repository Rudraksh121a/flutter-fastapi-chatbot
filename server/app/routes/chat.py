from fastapi import routing
from ..models.chat_model import ChatRequest
router = routing.APIRouter()



@router.post("/chat")
async def chat_endpoint(body: ChatRequest):
    #Search on web and get response
    # sort the sources based on relevance and credibility
    # generate response using the llm
    response = body.message
    return {"response": response}