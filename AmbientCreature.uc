class AmbientCreature extends SaveGameStatePawn;

var() array <AmbientCreatureNode> MyNodes;
var() float MinTravelTime,MaxTravelTime;
var() float Speed;
var() float RotateSpeed;
var() float ScaleMin,ScaleMax;
//var StaticMeshComponent DisplayMesh;
var SkeletalMeshComponent DisplayMesh;
//var DynamicLightEnvironmentComponent LightEnvironment;
var Vector MoveLocation, MoveOffset, MoveDirection;
var() Rotator MyDesiredRotation;
//var() Rotator DesiredRotationMac;
var Int Idx;
var AmbientCreatureNode DestNode;
var() bool   bGoFish;
//var() bool   bNiceTry;
//var AnimNodePlayCustomAnim              Catch;
//var() Rotator MoveBack;



simulated function PostBeginPlay()
{
	local Float RandVal;

	Super.PostBeginPlay();

	SetDrawScale(RandRange(ScaleMin,ScaleMax));
	RandVal = RandRange(1.5,11.5);
	Speed *= RandVal;
	RotationRate *= RandVal * (Speed / Default.Speed);

	SetRandDest();
}
exec function testing()
{

     MessagePlayer("set test");
}


exec function SetRandDest()
{

	//local AmbientCreatureNode DestNode;
	local Float MoveInterval;

        //if (bGoFish)
        //{
	Idx = Rand(MyNodes.Length);
	DestNode = MyNodes[Idx];
     MoveInterval = VSize(DestNode.Location - Location) / Speed;
     SetDest(DestNode);
     SetTimer(RandRange(FMin(MinTravelTime,MoveInterval),FMin(MaxTravelTime,MoveInterval)),false,'SetRandDest');
     //MessagePlayer("what");
        //}
}

exec function SetDest(AmbientCreatureNode inNode)
{          

        MyDesiredRotation = Rotator(MoveDirection);

	MoveOffset = Normal(VRand()) * inNode.Radius;
	MoveLocation = inNode.Location + MoveOffset;
        MoveDirection = (MoveLocation) - Location;
        //MoveBack = Rotator(MoveDirection) * -1;

}


function Tick(float Delta)
{
         super.Tick(Delta);
         Velocity = Normal(MoveDirection)*Speed;
         if (bGoFish)
         {
         SetRotation(RInterpTo(Rotation,Rotator(MoveDirection),Delta,90000,true));
         }
}



defaultproperties
{


        Begin Object Class=SkeletalMeshComponent Name=MySkeletalMesh
	//Begin Object Class=StaticMeshComponent Name=MyStaticMesh
          LightEnvironment=MyLightEnvironment
     End Object
   	Components(1)=MySkeletalMesh
     CollisionComponent=MySkeletalMesh
       Components.Remove(WPawnSkeletalMeshComponent)
       	Components.Remove(CollisionCylinder)
     DisplayMesh=MySkeletalMesh
     bCollideWorld=true
     bCollideActors=true
     Physics=PHYS_Flying
     bStatic=false
     bMovable=true

}

