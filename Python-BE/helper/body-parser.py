# this file is for debugging purposes only and can be deleted
from fastapi import Request

async def set_body(request: Request, body: bytes):
    async def receive():
        return {"type": "http.request", "body": body}
    request._receive = receive
 
async def get_body(request: Request) -> bytes:
    body = await request.body()
    await set_body(request, body)
    return body

# append these 2 lines of code at the start of validate_access_token function
# await set_body(request, await request.body())
# print(await get_body(request))
