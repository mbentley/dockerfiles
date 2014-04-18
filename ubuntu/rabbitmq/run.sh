#!/bin/bash

RMQ_USER=${RMQ_USER:-guest}
RMQ_PASS=${RMQ_PASS:-guest}

/usr/bin/supervisord
