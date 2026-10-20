#!/usr/bin/bash
# -*- coding: utf-8 -*-

echo "Locations en 2016" 
grep -r "Location" ../../Exercice1/ann/2016 | wc -l
echo "Locations en 2017" 
grep -r "Location" ../../Exercice1/ann/2017 | wc -l
echo "Locations en 2018" 
grep -r "Location" ../../Exercice1/ann/2018 | wc -l
