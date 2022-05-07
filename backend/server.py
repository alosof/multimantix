from pathlib import Path

from aiohttp import web
from loguru import logger


async def index(request):
    logger.info(f"User connected from: {request.remote}")
    with open(Path(__file__).parent / "index.html") as f:
        return web.Response(text=f.read(), content_type="text/html")


app = web.Application()
app.router.add_get("/", index)

if __name__ == "__main__":
    web.run_app(app)
