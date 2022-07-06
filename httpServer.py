from http.server import HTTPServer, SimpleHTTPRequestHandler

class AllowAllSimpleHTTPRequestHandler(SimpleHTTPRequestHandler):
    def end_headers(self) -> None:
        self.send_header('Access-Control-Allow-Origin', '*')
        super().end_headers()

if __name__ == '__main__':
    HTTPServer(('', 8000), RequestHandlerClass=AllowAllSimpleHTTPRequestHandler).serve_forever()
