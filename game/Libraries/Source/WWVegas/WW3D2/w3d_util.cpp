// cl: /DNDEBUG /MD /Igame/Libraries/Source/WWVegas/WWMath /Igame/Libraries/Source/WWVegas/WWLib /Igame/Libraries/Source/WWVegas/WW3D2 /Igame/Libraries/Source/WWVegas/WWSaveLoad /Igame/Libraries/Source/WWVegas/Wwutil /Igame/Libraries/Source/WWVegas/WWDownload /Igame/Libraries/Source/Compression /Igame/Libraries/Source/WWVegas/WWDebug /Iinputs/reference/shims/sweep
/*
**	Command & Conquer Generals Zero Hour(tm)
**	Copyright 2025 Electronic Arts Inc.
**
**	This program is free software: you can redistribute it and/or modify
**	it under the terms of the GNU General Public License as published by
**	the Free Software Foundation, either version 3 of the License, or
**	(at your option) any later version.
**
**	This program is distributed in the hope that it will be useful,
**	but WITHOUT ANY WARRANTY; without even the implied warranty of
**	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
**	GNU General Public License for more details.
**
**	You should have received a copy of the GNU General Public License
**	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/***********************************************************************************************
 ***              C O N F I D E N T I A L  ---  W E S T W O O D  S T U D I O S               ***
 ***********************************************************************************************
 *                                                                                             *
 *                 Project Name : WW3D                                                         *
 *                                                                                             *
 *                     $Archive:: /Commando/Code/ww3d2/w3d_util.cpp                           $*
 *                                                                                             *
 *                       Author:: Greg Hjelstrom                                               *
 *                                                                                             *
 *                     $Modtime:: 7/23/01 5:31p                                               $*
 *                                                                                             *
 *                    $Revision:: 5                                                           $*
 *                                                                                             *
 *---------------------------------------------------------------------------------------------*
 * Functions:                                                                                  *
 * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */


#include "w3d_util.h"
#include "vector3.h"
#include "vector4.h"
#include "quat.h"
#include "shader.h"


void	W3dUtilityClass::Convert_Vector(const W3dVectorStruct & v,Vector3 * set)
{
	set->X = v.X;
	set->Y = v.Y;
	set->Z = v.Z;
}

void	W3dUtilityClass::Convert_Vector(const Vector3 & v,W3dVectorStruct * set)
{
	set->X = v.X;
	set->Y = v.Y;
	set->Z = v.Z;
}

// ?W3dUtilityClass::Convert_Quaternion present-unmatched
void	W3dUtilityClass::Convert_Quaternion(const W3dQuaternionStruct & q,Quaternion * set)
{
	set->X = q.Q[0];
	set->Y = q.Q[1];
	set->Z = q.Q[2];
	set->W = q.Q[3];
}

// ?W3dUtilityClass::Convert_Quaternion present-unmatched
void W3dUtilityClass::Convert_Quaternion(const Quaternion & q,W3dQuaternionStruct * set)
{	
	set->Q[0] = q.X;
	set->Q[1] = q.Y;
	set->Q[2] = q.Z;
	set->Q[3] = q.W;
}

void	W3dUtilityClass::Convert_Color(const W3dRGBStruct & rgb,Vector3 * set)
{
	set->X = (float)rgb.R / 255.0f;
	set->Y = (float)rgb.G / 255.0f;
	set->Z = (float)rgb.B / 255.0f;
}

void	W3dUtilityClass::Convert_Color(const Vector3 & v,W3dRGBStruct * color)
{
	color->R = (uint8)(255.0f * v.X);
	color->G = (uint8)(255.0f * v.Y);
	color->B = (uint8)(255.0f * v.Z);
	color->pad = 0;
}

void W3dUtilityClass::Convert_Color(const W3dRGBAStruct & rgb,Vector4 * set)
{
	set->X = (float)rgb.R / 255.0f;
	set->Y = (float)rgb.G / 255.0f;
	set->Z = (float)rgb.B / 255.0f;
	set->W = (float)rgb.A / 255.0f;
}

void W3dUtilityClass::Convert_Color(const Vector4 & v,W3dRGBAStruct * color)
{
	color->R = (uint8)(255.0f * v.X);
	color->G = (uint8)(255.0f * v.Y);
	color->B = (uint8)(255.0f * v.Z);
	color->A = (uint8)(255.0f * v.W);
}
