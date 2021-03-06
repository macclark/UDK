//This is code for the fly rod to work as pawn.
//this is code under dev
//mc

class MyPawn extends Pawn;

var DynamicLightEnvironmentComponent LightEnvironment;
var name           	rod;
var name           	endofline;
var SkeletalMeshComponent	rodandreelworking1aa;
var PhysicsAsset     rodandreelworking1aa_Physics2;
//var AnimNodeBlend                 start;
var AnimNodeBlendList		IdleRandom;
//var AnimNodeBlend              shortcast;
//var AnimNodeBlend                mediumcast;
var AnimNodePlayCustomAnim              Best;
var AnimNodePlayCustomAnim               catch;
var AnimNodePlayCustomAnim               longcast;
var AnimNodePlayCustomAnim               fullcast;
var AnimNodePlayCustomAnim               castset;
var AnimNodePlayCustomAnim               Idle2;
var UDKSkelControl_MassBoneScaling       CastLongerName;
var() Name                               CastLonger;
var() SkeletalMeshComponent            WeaponSkeletalMesh;
var() Bool bFreeFish;


// Initialize all of the AnimNode references for animations

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	super.PostInitAnimTree( SkelComp );
          if (SkelComp == Mesh)

         {
 	IdleRandom = AnimNodeBlendList(Mesh.FindAnimNode('IdleRandom'));
          Best  = AnimNodePlayCustomAnim(Mesh.FindAnimNode('Best'));
          catch  = AnimNodePlayCustomAnim(Mesh.FindAnimNode('Catch'));
          Idle2  = AnimNodePlayCustomAnim(Mesh.FindAnimNode('Idle2'));
          fullcast = AnimNodePlayCustomAnim(Mesh.FindAnimNode('fullcast'));
          castset = AnimNodePlayCustomAnim(Mesh.FindAnimNode('castset'));
  	  fullcast.SetBlendTarget(1.0f, 0.0f);
          Idle2.SetBlendTarget(1.0f, 0.0f);

         }

}

//using this function to add anything or run a function when Pawn runs
function PostBeginPlay()
{
  Super.PostBeginPlay();
  // Mesh.AttachComponentToSocket(P_WP_Line, 'Line');
 // P_WP_Line.SetAbsolute(false, false, false);
//P_WP_Line.bUpdateComponentInTick = true;
//P_WP_Line.SetTickGroup(TG_EffectsUpdateWork);


}


//this is my idle animation with different attempts at cloth and phyics blending animations
exec function Idle()
{
	 //Mesh.ClothBlendWeight = 0.0f;
        //start.SetBlendTarget(0.0f, 0.2f);
        // IdleRandom.PlayCustomAnimByDuration('IdleRandom', 2.5, 0.f, -1.f, FALSE, TRUE);
       IdleRandom.PlayAnim(true, 1.0f, 0.0f);
}


exec function Macdaddy()
{
     FixRB();
     Cast();
     //OnAnimEnd(fullcast);
     settimer(3,false,'UnFixRB');
     //UnFixRB();

}

exec function Idle2M()
{
     //FixRB();
        //  fullcast.PlayCustomAnimByDuration('fullcast2' /*AnimSequence.SwordAttack1*/, 3, 0.f, -1.f, FALSE, TRUE);
     //Idle2.PlayCustomAnimByDuration('Idle', 1, 0.f, -1.f, TRUE, TRUE);
        settimer(0.04,false,'FixRB');
     settimer(0.05,false,'Idle2Mac');

      //  settimer(3,false,'UnFixRB');

}


exec function Idle2Mac()
 {
     //FixRB();
      //    fullcast.PlayCustomAnimByDuration('fullcast2' /*AnimSequence.SwordAttack1*/, 3, 0.f, -1.f, FALSE, TRUE);
       Idle2.PlayCustomAnimByDuration('Idle', 11, 0.f, -1.f, TRUE, TRUE);
      // IdleRandom.PlayAnim(true, 1.0f, 0.0f);
      //  settimer(0.05,false,'FixRB');
      //  settimer(3,false,'UnFixRB');

}

exec function SetHook()
{
     //FixRB();

     castset.PlayCustomAnimByDuration('castset', 1, 0.f, -1.f, FALSE, TRUE);
     settimer(1,false,'FixRB');
}

//A Macdaddy for a Daddymac
exec function DaddyMac()
{
      FixRB();
     //OnAnimEnd(fullcast);
     //settimer(0,false,'SetHook');

}

 //this is for the trigger system so you don't hook mutiple fish
 exec function UnFreezeFish()
 {
  bFreeFish=False;
 }
  //Object.MyPawn.bFreeFish



//this runs an animation on the flyrod to cast it
exec function Cast()
{

    //Best.PlayCustomAnimByDuration('Best' /*AnimSequence.SwordAttack1*/, 16, 0.f, -1.f, FALSE, TRUE);
    // longcast.PlayCustomAnimByDuration('longcast' /*AnimSequence.SwordAttack1*/, 3, 0.f, -1.f, FALSE, TRUE);
    //Sleep(2.6);
    //longcast.bCauseActorAnimEnd = true;
    //Mesh.ClothBlendWeight = 0.2f;
                            //MessagePlayer("cast works");
                             bFreeFish = true;
                    Idle2.StopCustomAnim(0.05);
                    fullcast.PlayCustomAnimByDuration('fullcast2' /*AnimSequence.SwordAttack1*/, 3, 0.f, -1.f, FALSE, TRUE);
                    settimer(0.05,false,'FixRB');
                    settimer(3,false,'UnFixRB');

      //  fullcast.bCauseActorAnimEnd = true;
      //fullcast.SetActorAnimEndNotification(false);
      //SetTimer(3.0, true);
     //	fullcast.SetActorAnimEndNotification
     //BlendInPhysics();
     //UnFixRB();
}

 //Day is as Night
//event OnAnimEndRB(AnimNodeSequence AnimNodeSequence, float PlayedTime, float ExcessTime)
//{
//	FixRB();
//        castset.SetActorAnimEndNotification(true);

//}

//this function turns on more physics, working redundantly twice
//event OnAnimEnd(AnimNodeSequence AnimNodeSequence, float PlayedTime, float ExcessTime)
//{
	//TurnOnRagdoll(Vect(0.f, 0.f, 0.f));
//	fullcast.SetActorAnimEndNotification(true);
//	UnFixRB();
//}

//This is used to trace physics and log it

//function Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
// {
//super.Bump(Other, OtherComp, HitNormal);

//MessagePlayer("bump works");
// }

 //This is used to trace phy hits and log it
// event HitWall( vector HitNormal, actor Wall, PrimitiveComponent WallComp )
// {
// super.HitWall(HitNormal,Wall, WallComp);
 //MessagePlayer("hit works");
// }

//event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
// {
// super.Touch(Other, OtherComp, HitLocation, HitNormal);
//MessagePlayer("touch works");
// }

//this runs the catch me animation putting a fish on your line
exec function CatchMe()
{

   catch.PlayCustomAnimByDuration('catch' /*AnimSequence.SwordAttack1*/, 2.5, 0.f, -1.f, TRUE, TRUE);

}
//exec function SetBoneScale(Bone4,1)

//rigid bodies become unfixed on the mesh importantly used
exec function UnFixRB()

{
        //PreRagdollCollisionComponent = CollisionComponent;
	//CollisionComponent = Mesh;
        Mesh.SetRBChannel(RBCC_Pawn);
	Mesh.SetRBCollidesWithChannel(RBCC_Default,TRUE);
	Mesh.SetRBCollidesWithChannel(RBCC_Pawn,TRUE);
	Mesh.SetRBCollidesWithChannel(RBCC_Vehicle,TRUE);
	Mesh.SetRBCollidesWithChannel(RBCC_Untitled3,FALSE);
	Mesh.SetRBCollidesWithChannel(RBCC_BlockingVolume,TRUE);
	Mesh.ForceSkelUpdate();
        Mesh.UpdateRBBonesFromSpaceBases(TRUE, TRUE);
	Mesh.PhysicsWeight = 0.1;
	Mesh.bUpdateKinematicBonesFromAnimation=TRUE;
        Mesh.PhysicsAssetInstance.SetFullAnimWeightBonesFixed(false, Mesh) ;
        Mesh.SetRBLinearVelocity(Velocity, false);
	Mesh.SetTranslation(vect(0,0,1) * 6);
	Mesh.ScriptRigidBodyCollisionThreshold = MaxFallSpeed;
	Mesh.SetNotifyRigidBodyCollision(true);

//	Mesh.WakeRigidBody();


}


//This is the Fix animation blend from cast to set the hook
exec function FixRB()
{                         	Mesh.ForceSkelUpdate();
                                    //Mesh.UpdateRBBonesFromSpaceBases(TRUE, TRUE);
                         Mesh.SetRBChannel(RBCC_Untitled3);
                         	Mesh.SetRBCollidesWithChannel(RBCC_Default,TRUE);
	Mesh.SetRBCollidesWithChannel(RBCC_Pawn,TRUE);
	Mesh.SetRBCollidesWithChannel(RBCC_Vehicle,TRUE);
	Mesh.SetRBCollidesWithChannel(RBCC_Untitled3,FALSE);
	Mesh.SetRBCollidesWithChannel(RBCC_BlockingVolume,TRUE);
	        	Mesh.PhysicsWeight = 1.f;
        		//Mesh.RBCollideWithChannels=(Untitled3=true);
        		//Mesh.bHasPhysicsAssetInstance=true;
         		//Mesh.TickGroup=TG_PreAsyncWork ;
          		//Mesh.RBDominanceGroup=20;
                	Mesh.bUpdateJointsFromAnimation=true;
	Mesh.bUpdateKinematicBonesFromAnimation=true;
       Mesh.PhysicsAssetInstance.SetFullAnimWeightBonesFixed(true, Mesh);
       Mesh.UpdateAnimations();
//	Mesh.SetNotifyRigidBodyCollision(true);
//	Mesh.WakeRigidBody();
        Mesh.PutRigidBodyToSleep();
}

   
   



DefaultProperties
{

  // the extra props from physics sim new code

    bFreeFish=True

//The thought here was to make the line float
 

   Components.Remove(Sprite)

   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
     bSynthesizeSHLight=FALSE
     bIsCharacterLightEnvironment=TRUE
    bCastShadows=FALSE
     bCompositeShadowsFromDynamicLights=FALSE
     bDynamic=FALSE

  End Object

   LightEnvironment=MyLightEnvironment
    Components.Add(MyLightEnvironment)



     //this is the fly rod props
   Begin Object Class=SkeletalMeshComponent Name=WPawnSkeletalMeshComponent

	        SkeletalMesh=SkeletalMesh'MESH_M2.rodandreelworking12w'
		AnimSets.Add(AnimSet'WP_FlyRod.Mesh.NewAnimSeta')
		PhysicsAsset=PhysicsAsset'MESH_M2.rodandreelworking12w_Physics'
		AnimTreeTemplate=AnimTree'WP_FlyRod.Mesh.Cast'
                HiddenGame=FALSE
	        HiddenEditor=FALSE
	        BlockRigidBody=TRUE
	        CollideActors=true
	        BlockActors=true
	        BlockZeroExtent=true
	        BlockNonZeroExtent=false
	        PhysicsWeight=1.0
	        RBChannel=RBCC_Untitled3
        	RBCollideWithChannels=(Untitled3=true)
        	bHasPhysicsAssetInstance=true
         	TickGroup=TG_PreAsyncWork
          	RBDominanceGroup=20
                bUpdateJointsFromAnimation=true
                    



		Translation=(X=6.1,Y=0,Z=-8)    //i'm using translation on the actual mesh and should remove this next time i import a mesh

               // Rotation=(Yaw=-2048)
               Scale=.095


   End Object

   Mesh=WPawnSkeletalMeshComponent
   Components.Add(WPawnSkeletalMeshComponent)
   
   


}


//I commented out a lot of this code to simplify things or experiment
//if I get to fly rod that works then I will clean more
