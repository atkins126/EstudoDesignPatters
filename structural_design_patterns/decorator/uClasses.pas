unit uClasses;

interface

uses uIBread;

type
  TBread = class(TInterfacedObject, IBread)
  protected
    function getName: string; virtual; abstract;
    function getPrice: Double; virtual; abstract;
    function getSelfPrice: Double; virtual; abstract;
  public
    property Name: string read getName;
    property Price: Double read getPrice;
    property SelfPrice: Double read getSelfPrice;
  end;

type
  TFrenchBread = class(TBread)
  private
    FName: string;
    FPrice: Double;
  protected
    function getPrice: Double; override;
    function getName: string; override;
    function getSelfPrice: Double; override;
  public
    constructor Create(APrice: Double);
    property Price: Double read getPrice;
    property SelfPrice: Double read getSelfPrice;
  end;

type
  TFrenchStick = class(TBread)
  private
    FName: string;
    FPrice: Double;
  protected
    function getPrice: Double; override;
    function getName: string; override;
    function getSelfPrice: Double; override;
  public
    constructor Create(APrice: Double);
    property Price: Double read getPrice;
    property SelfPrice: Double read getSelfPrice;
  end;

implementation

{ TFrenchBread }

constructor TFrenchBread.Create(APrice: Double);
begin
  FName := 'French Bread';
  FPrice := APrice;
  inherited Create;
end;

function TFrenchBread.getName: string;
begin
  Result := FName;
end;

function TFrenchBread.getPrice: Double;
begin
  Result := FPrice;
end;

function TFrenchBread.getSelfPrice: Double;
begin
  Result := FPrice;
end;

{ TFrenchStick }

constructor TFrenchStick.Create(APrice: Double);
begin
  FName := 'French Stick';
  FPrice := APrice;
end;

function TFrenchStick.getName: string;
begin
  Result := FName;
end;

function TFrenchStick.getPrice: Double;
begin
  Result := FPrice;
end;

function TFrenchStick.getSelfPrice: Double;
begin
  Result := FPrice;
end;

end.
