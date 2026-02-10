from fastapi import FastAPI,routing,WebSocket,WebSocketDisconnect
from ..models.chat_model import ChatRequest
from ..services.chat_services import fetch_real_time_data



router = routing.APIRouter()

@router.post("/chat")
def chat_endpoint(body: ChatRequest):
    response =  fetch_real_time_data(body.message)
    return {"response": response.message["content"][0]["text"]}


@router.websocket("/ws/chat")
@router.websocket("/ws/chat/")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    try:
        while True:
            data = await websocket.receive_json()
            query = data.get("message", "")
            response = fetch_real_time_data(query)
            print(f"Received query: {query}, Response: {response.message['content'][0]['text']}")
            await websocket.send_json({
                "type": "search_result",
                "response": response.message["content"][0]["text"]
            })
    except WebSocketDisconnect:
        print("WebSocket disconnected")
    except Exception as e:
        print(f"WebSocket error: {e}")
        await websocket.close()
