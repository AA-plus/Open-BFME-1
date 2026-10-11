// cl: /O2 /arch:SSE /G6 /MD /D_CRTIMP=
// ?rva008B66B0@Rva008B6880@@QAEHHHH@Z
#include <stdlib.h>
#include <math.h>
#pragma intrinsic(abs)
bool __stdcall isLeapYear(int year);
class Rva008B6880 {
public:
    int rva008B66B0(int year,int month,int day);
};
// ?leap008B66B0@@YA_NH@Z absent-from-retail
static bool leap008B66B0(int year)
{
    bool result = false;
    if (year % 4 == 0) {
        if (year % 100 != 0) return true;
        result = year % 400 == 0;
    }
    return result;
}
// Open BFME 2 Code/Libraries/Source/Apt/AptDateGetDayOfWeek.cpp.
int Rva008B6880::rva008B66B0(int year,int month,int day)
{
    int reference=month+1;
    unsigned long last=year%100;
    int century=year/100;
    int anchor;
    unsigned int anchors[4] = {3,2,0,5};
    if (century < 19) anchor=4-abs(century-19)%4;
    else anchor=abs(century-19)%4;
    anchor=anchors[anchor];
    long base=year-last;
    if (month==1) reference=28+(leap008B66B0(year)?1:0);
    else if (month%2==0) {
        if (month==8) reference=5;
        else if (4 == month) reference=9;
        else if (month==6) reference=11;
        else if (month==10) reference=7;
        else if (month==2) reference=7;
        else if (month==0) {
            typedef bool (Rva008B6880::*LeapMember)(int);
            union { bool (__stdcall *entry)(int); LeapMember member; } native;
            typedef char SamePointerWidth[sizeof(native.entry) == sizeof(native.member) ? 1 : -1];
            native.entry = isLeapYear;
            reference=31+((this->*native.member)(year)?1:0);
        }
    }
    if (anchor<0 || reference<0) return -1;
    int adjusted=day;
    if (reference>adjusted) adjusted=reference-(reference-adjusted)%7+7;
    int value = (((int)floor((year-base)*0.25f)-base+anchor+year)%7+(adjusted-reference)%7)%7;
    return value;
}
