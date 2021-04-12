unit Pattern.Director;

interface

uses
  Pattern.Builder;

type
  { Director }
  TDirector = class
  public
    procedure Construct(Builder: IBuilder);
  end;

implementation

{ TDirector }

procedure TDirector.Construct(Builder: IBuilder);
begin
  Builder.StartVehicle;
  Builder.BuildFrame;
  Builder.BuildEngine;
  Builder.BuildWheels;
  Builder.BuildDoors;
  Builder.FinishVehicle;
end;

end.

