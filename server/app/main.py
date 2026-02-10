from fastapi import FastAPI,routing
from app.routes import health as health_route
from app.routes import chat as chat_route
app=FastAPI()

app.include_router(health_route.router)
app.include_router(chat_route.router)
