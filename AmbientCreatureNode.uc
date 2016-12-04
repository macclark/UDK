class AmbientCreatureNode extends Info placeable;

var Float Radius;
var() Const EditConst DrawSphereComponent RadiusComponent;

function PreBeginPlay()
{
	Radius = RadiusComponent.SphereRadius;
	Super.PreBeginPlay();
}


defaultproperties
{
	Begin Object Class=DrawSphereComponent Name=DrawSphere0
     	SphereColor=(B=255,G=70,R=64,A=255)
     	SphereRadius=48.000000
	End Object
	RadiusComponent=DrawSphere0
	Components.Add(DrawSphere0);
}