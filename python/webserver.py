import BaseHTTPServer, SimpleHTTPServer
server = BaseHTTPServer.HTTPServer(('',80),SimpleHTTPServer.SimpleHTTPRequestHandler)
server.serve_forever()
