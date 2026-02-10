from fastapi import routing

router = routing.APIRouter()

@router.get("/health")
async def health_check():
    return {"status": "ok"}