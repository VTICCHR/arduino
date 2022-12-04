import processing.serial.*;
import processing.net.*;
Server s; // 80번 포트로 Server 소켓통신 설정
Client c; // 핸드폰 Client 소켓통신 설정
Serial p; // 아두이노 Serial Port 설정

void setup(){
  size(600,600);      // 캔버스 사이즈 설정           
  s = new Server(this, 11111);       //Server의 객체 s를 만들고 포트 번호를 11111로 설정
                                              // this가 앱인벤터의 http://192.168.***.****:11111의 IP 주소를 받는다는 표시.
  p = new Serial(this, "COM8", 9600); // Com8 시리얼 통신 9600bps로 Open
}

void draw(){
  c = s.available();                         //s객체를 c클라이언트에서 참조.
  if(c!=null){
    String msg;
    msg = c.readString();                                       //텍스트를 읽어서 msg에 대입.
    msg =  msg.substring(msg.indexOf("-gzip")+14);
    text(msg,400,200);                                             //텍스트의 위치 설정.
    m = msg.substring(n); // LED 깜빡임 속도 잘라 내는 위치   //
    m += '\n';           // 표시할 문자
    p.write(m); // 아두이노 시리얼 포트로 LED깜빡임 속도값 보내기 
  }
}
