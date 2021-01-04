#!/bin/sh
for i in $(cat known_hosts.txt)
	do
		ssh-keyscan $i >> ~/.ssh/known_hosts
	done
