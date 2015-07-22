import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res) {
	res.render!("index.dt", req);
}

shared static this() {
	auto router = new URLRouter;
	router.get("/", &index);
	router.get("*", serveStaticFiles("./public/"));

	auto settings = new HTTPServerSettings;
	settings.port = 8888;

	listenHTTP(settings, router);
}