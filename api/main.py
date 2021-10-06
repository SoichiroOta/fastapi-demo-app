from typing import Any, Dict

from fastapi import FastAPI

app = FastAPI()


@app.get("/hello")
async def hello() -> Dict[str, Any]:
    return {"message": "hello world!"}
