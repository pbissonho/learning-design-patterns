abstract class SocketInterface {
  String readLine();

  void writeLine(String str);

  void dispose();
}

class SocketProxy with SocketInterface {
  Socket socket;
  BufferedReader _in;
  PrintWriter out;

  SocketProxy(String host, int port, bool wait) {
    try {
      if (wait) {
        ServerSocket server = ServerSocket(port);
        socket = server.accept();
      } else {
        socket = Socket(host, port);
      }
      _in = BufferedReader(InputStreamReader(socket.getInputStream()));
      out = PrintWriter(socket.getOutputStream(), true);
    } catch (e) {
      print(e.message);
    }
  }

  String readLine() {
    String str;

    try {
      str = _in.readLine();
    } catch (e) {
      print(e.message);
    }
    return str;
  }

  void writeLine(String str) {
    out.println(str);
  }

  void dispose() {
    try {
      socket.close();
    } catch (e) {
      print(e.message);
    }
  }
}

class InputStreamReader {
  InputStreamReader(inputStream);
}

class ServerSocket {
  ServerSocket(int port);

  Socket accept() {
    return Socket("", 8000);
  }
}

class Socket {
  Socket(String host, int port);

  getInputStream() {}

  getOutputStream() {}

  void close() {}
}

class PrintWriter {
  PrintWriter(outputStream, bool param1);

  void println(String str) {}
}

class BufferedReader {
  BufferedReader(inputStreamReader);

  String readLine() {
    return "";
  }
}

class ProxyDemo {
  static void main(List<String> args) {
    SocketInterface socket =
        SocketProxy("127.0.0.1", 8080, (args[0] == "first") ? true : false);
    String str;
    bool skip = true;
    while (true) {
      if ((args[0] == "second") && skip) {
        skip = (!skip);
      } else {
        str = socket.readLine();
        print("Receive - " + str);
        if (str == null) {
          break;
        }
      }
      print("Send ---- ");
      //str = new Scanner().nextLine();
      socket.writeLine(str);
      if (str == "quit") {
        break;
      }
    }
    socket.dispose();
  }
}

class Scanner {
  Scanner(in_);

  String nextLine() {
    return "";
  }
}
