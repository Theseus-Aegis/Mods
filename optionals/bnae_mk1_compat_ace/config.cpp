class CfgPatches
{
	class bnae_mk1_compat_ace
	{
		requiredaddons[]=
		{
			"A3_Weapons_F",
			"bnae_core",
			"bnae_mk1"
		};
		requiredversion=0.1;
		weapons[]=
		{
			"bnae_mk1_virtual",
			"bnae_mk1_t_virtual",
			"bnae_mk1_t_camo1_virtual",
			"bnae_mk1_no4_t_virtual"
		};
		units[]=
		{
			"bnae_mk1_editor"
		};
	};
};
class Mode_SemiAuto;
class CfgWeapons
{
	class Rifle_Long_Base_F;
	class bnae_mk1_base: Rifle_Long_Base_F
	{
        initSpeed=-1.0;
		ACE_barrelTwist=254.0;
		ACE_barrelLength=640.08;
		ACE_RailHeightAboveBore=1.8;
		class Single: Mode_SemiAuto
		{
			dispersion=0.00044;
		};
	};
};
class CfgMagazines
{
	class CA_Magazine;
    class 10Rnd_303_Magazine: CA_Magazine
	{
		ammo="B_303_Ball";
		initSpeed=763; // muzzle velocity according with the barrel length
	};
};
class CfgAmmo
{
	class BulletBase;
    class B_303_Ball: BulletBase // class ACE_303_Ball; https://github.com/acemod/ACE3/blob/e5a15d200f44df5fccc0bc5575d18d80b35538dd/extras/CfgAmmoReference.hpp#L412
	{
		typicalSpeed=763; // muzzle velocity according with the barrel length
		airFriction=-0.00083;
        ACE_caliber=7.899;
        ACE_bulletLength=31.166;
        ACE_bulletMass=11.2752;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.493};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={763}; // muzzle velocity according with the barrel length
        ACE_barrelLengths[]={640.08};
	};
};
