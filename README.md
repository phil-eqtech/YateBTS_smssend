# smssend

This fork enhances the [`smssend`](https://github.com/entropyqueen/YateBTS_smssend) C++ plugin for YateBTS.

It adds a command to send binary SMS.

Furthermore, it disables the Eliza feedback message when an error occurs, allowing better automation.

## Installation

First of all, you need to install yate and yateBTS. 

Using a BladeRF x40, I used the `yate-rc-2.tar.gz` archive and [NUAND's instructions](https://www.nuand.com/support/#bts)


## Usage - SMS

First, launch Yate, then connect to the remote interface:
```
$ telnet localhost 5038
```

type the following command to get the help message:
```
help smssend
```
which outputs the following.
```
  smssend <MSISDN> <CALLER> <message>
send text messages to a particular MS
```

* MSISDN is the MSISDN of the target device.
* CALLER is the caller id, can be a MSISDN or garbage, or pretty much anything you want.
* message is the text message

You can retrieve the MSISDN of the device you want by running 

```
nipc list registered
MSI            MSISDN 
--------------- ---------------
XXXXXXXXXXXXXXX 331969692
```
Then send the sms running:
```
smssend 331969692 0 this is a test
message succesfuly sent.
```

If the phone received the SMS, congratulation, everything works fine!

## Usage - binary SMS

Still using the remote interface:
```
$ telnet localhost 5038
```

type the following command to get the help message:
```
help smsbsend
```
which outputs the following.
```
  smssend <MSISDN> <CALLER> <rpdu>
send binary text messages to a particular MS
```

* MSISDN is the MSISDN of the target device.
* CALLER is the caller id, can be a MSISDN or garbage, or pretty much anything you want.
* rpdu is the binary payload 


Then send the binary sms running, here a GSM 7-bit message "HelloToto":
```
smsbsend 331969692 888 01000280f0001704038088f800005290211153200009c8329bfda6bee96f
binary message succesfuly sent.
```

To test your binary payload, I do recommend [JavaScript PDU Mode SMS decoder](https://smspdu.benjaminerhart.com/?pdu=07911326040000F0040B911346610089F60000208062917314080CC8F71D14969741F977FD07).

Note that the caller ID specified is not the one displayed on the message, as it is embedded in the RPDU, see [Introduction to SMS PDU Mode](https://www.gsmfavorites.com/documents/sms/pdutext/).


## Contributing

If you encounter any problems, please fill an issue on github, and if you have ideas and the time to develop them, do not hesitate to make forks or pull requests!

http://wiki.yatebts.com/index.php/Ybts_module
