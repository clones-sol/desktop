#!/usr/bin/env python3
"""
Mock Tauri API server to provide basic endpoints for the Flutter app.
This is a temporary solution until the full Tauri backend can be run.
"""

import json
import http.server
import socketserver
from urllib.parse import urlparse, parse_qs
import threading
import time

class MockTauriHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        """Handle GET requests"""
        path = self.path
        
        if path == '/deeplink':
            # Return null deep link (no deep link available)
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            response = json.dumps({"url": None})
            self.wfile.write(response.encode())
            
        elif path == '/platform':
            # Return Linux platform
            self.send_response(200)
            self.send_header('Content-Type', 'text/plain')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            self.wfile.write(b'linux')
            
        elif path == '/settings/upload-allowed':
            # Return upload allowed status
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            self.wfile.write(b'true')
            
        elif path == '/recordings':
            # Return empty recordings list
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            self.wfile.write(b'[]')
            
        elif path == '/tools/check':
            # Return tools status
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            response = json.dumps({
                "ffmpeg": False,
                "pipeline": False,
                "axtree": False
            })
            self.wfile.write(response.encode())
            
        else:
            # Return success for other endpoints to prevent errors
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            self.wfile.write(b'{"success": true}')
    
    def do_POST(self):
        """Handle POST requests"""
        path = self.path
        content_length = int(self.headers.get('Content-Length', 0))
        post_data = self.rfile.read(content_length) if content_length > 0 else b''
        
        # Return success for all POST requests
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()
        self.wfile.write(b'{"success": true}')
    
    def do_OPTIONS(self):
        """Handle OPTIONS requests for CORS"""
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        self.end_headers()
    
    def log_message(self, format, *args):
        """Override to reduce noise, only log important requests"""
        if 'deeplink' not in self.path:
            print(f"[{time.strftime('%H:%M:%S')}] {format % args}")

def run_mock_server():
    """Run the mock server on port 19847"""
    PORT = 19847
    
    print(f"🚀 Starting Mock Tauri API Server on port {PORT}")
    print("This provides basic endpoints to stop the connection errors in Flutter.")
    print("Press Ctrl+C to stop the server.")
    
    try:
        with socketserver.TCPServer(("127.0.0.1", PORT), MockTauriHandler) as httpd:
            print(f"✅ Mock server running at http://127.0.0.1:{PORT}")
            print("🔄 Your Flutter app should now connect successfully!")
            httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n🛑 Mock server stopped")
    except OSError as e:
        if "Address already in use" in str(e):
            print(f"❌ Port {PORT} is already in use. Another server might be running.")
        else:
            print(f"❌ Error starting server: {e}")

if __name__ == "__main__":
    run_mock_server()
