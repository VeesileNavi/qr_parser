# qr_parser

Parsing library for the most popular QR-code types

## For what?

There was a need to process standard data, which is usually encrypted in qr codes (an example of work can be seen when scanning a qr code with any native camera application).
But no libraries of this type were found on pub.dev.
So i wrote it by myself.

### The principle of operation is insanely simple:
We process raw data from the qr-code with a parser -> we get its type and then we work with a convenient data format.

### Currently supports:
* Text,
* wifi,
* links,
* Phone,
* SMS,
* E-mail.

In the future, I will add support for v-card and much more, to which my hands will reach.

Any help is welcome!❤
