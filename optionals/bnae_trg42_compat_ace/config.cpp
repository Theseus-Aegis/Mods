class CfgPatches
{
	class bnae_trg42_compat_ace
	{
		requiredaddons[]=
		{
			"bnae_trg42",
            "bnae_core",
            "bnae_silencer",
            "bnae_muzzle",
            "cba_jr"
		};
		requiredversion=0.1;
		weapons[]=
		{
		};
		units[]=
		{
		};
	};
};
class Mode_SemiAuto;
class asdg_OpticRail;
class asdg_OpticRail1913: asdg_OpticRail
{
};
class CfgWeapons
{
	class Rifle_Base_F;
	class Rifle_Long_Base_F: Rifle_Base_F
    {
		class WeaponSlotsInfo;
    };
	class bnae_trg42_base: Rifle_Long_Base_F // http://cdn1.sako.fi/sites/default/files/TRG-42_Tech_specs.pdf
	{
        initSpeed=-1.0;
		ACE_barrelTwist=254.0; // 1:10"
		ACE_barrelLength=690.0; // 27 1/8"
		ACE_RailHeightAboveBore=1.8;
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class asdg_OpticRail_bnae: asdg_OpticRail1913
			{
			};
		};
        class Single: Mode_SemiAuto
		{
			dispersion=0.00023; // 0.8 MOA; default: 0.00044=1.5 MOA
		};
	};
    class ItemCore;
	class InventoryMuzzleItem_Base_F;
	class bnae_silencer_base: ItemCore // ACE3 values: https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgWeapons.hpp#L643
	{
		class ItemInfo: InventoryMuzzleItem_Base_F
		{
			class MagazineCoef
			{
				initSpeed=1.0;
			};
			class AmmoCoef
			{
				hit=1;
				typicalSpeed=1;
				airFriction=1;
				visibleFire=0.5;
				audibleFire=0.1;
				visibleFireTime=0.5;
				audibleFireTime=0.5;
                cost=1;
			};
			class MuzzleCoef
			{
				dispersionCoef="0.95f";
				artilleryDispersionCoef="1.0f";
				fireLightCoef="0.5f";
				recoilCoef="0.95f";
				recoilProneCoef="0.95f";
				minRangeCoef="1.0f";
				minRangeProbabCoef="1.0f";
				midRangeCoef="1.0f";
				midRangeProbabCoef="1.0f";
				maxRangeCoef="1.0f";
				maxRangeProbabCoef="1.0f";
			};
		};
	};
    class bnae_muzzle_base: ItemCore
	{
        class ItemInfo: InventoryMuzzleItem_Base_F
		{
			class MagazineCoef
			{
				initSpeed=1.0; // ACE3 value, default 0.6
			};
			class AmmoCoef // default values
			{
				hit=1;
				typicalSpeed=1;
				airFriction=1;
				visibleFire=0.8;
				audibleFire=0.9;
				visibleFireTime=0.5;
				audibleFireTime=0.5;
				cost=1;
			};
			class MuzzleCoef // ACE3 values
			{
				dispersionCoef="0.95f";
				artilleryDispersionCoef="1.0f";
				fireLightCoef="0.5f";
				recoilCoef="0.95f";
				recoilProneCoef="0.95f";
				minRangeCoef="1.0f";
				minRangeProbabCoef="1.0f";
				midRangeCoef="1.0f";
				midRangeProbabCoef="1.0f";
				maxRangeCoef="1.0f";
				maxRangeProbabCoef="1.0f";
			};
		};
	};
};
class CfgMagazines
{
	class CA_Magazine;
    class 5Rnd_338LM_Magazine: CA_Magazine // AtragMx GunList ".338LM 250gr"
	{
		initSpeed=921; // muzzle velocity according with the barrel length, default 1005
	};
	class 5Rnd_APDS_338LM_Magazine: 5Rnd_338LM_Magazine // AtragMx GunList ".338LM 300gr"
	{
		initSpeed=828; // muzzle velocity according with the barrel length, default 1120
	};
};
class CfgAmmo
{
	class BulletBase;
	class B_338LM_Ball: BulletBase // https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L419
	{
        typicalSpeed=921; // muzzle velocity according with the barrel length
        airFriction=-0.00060841; // ACE3 value, default -0.00045
        ACE_caliber=8.585;
        ACE_bulletLength=39.573;
        ACE_bulletMass=16.2;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.322};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={921}; // muzzle velocity according with the barrel length
        ACE_barrelLengths[]={690};
	};
	class B_338LM_APDS: B_338LM_Ball // https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L446
	{
        typicalSpeed=828; // muzzle velocity according with the barrel length
        airFriction=-0.00053585; // ACE3 value, default -0.00022
        ACE_caliber=8.585;
        ACE_bulletLength=43.18;
        ACE_bulletMass=19.44;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.368};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={828}; // muzzle velocity according with the barrel length
        ACE_barrelLengths[]={690};
	};
};
