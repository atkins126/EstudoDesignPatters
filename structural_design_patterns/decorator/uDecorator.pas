unit uDecorator;

interface

uses uClasses, System.SysUtils;

type
  TFilling = class(TBread)
  protected
  public
  end;

type
  TSalami = class(TFilling)
  protected
    FBread: TBread;
    FPrice: Double;
    FName: string;
    function getName: string; override;
    function getPrice: Double; override;
    function getSelfPrice: Double; override;
  public
    constructor Create(ABread: TBread; APrice: Double);
    destructor Destroy; override;
    property Name: string read getName;
    property Price: Double read getPrice;
    property SelfPrice: Double read getSelfPrice;
  end;

type
  TPepperoni = class(TFilling)
  protected
    FBread: TBread;
    FPrice: Double;
    function getName: string; override;
    function getPrice: Double; override;
    function getSelfPrice: Double; override;
  public
    constructor Create(ABread: TBread; APrice: Double);
    destructor Destroy; override;
    property Name: string read getName;
    property Price: Double read getPrice;
    property SelfPrice: Double read getSelfPrice;
  end;

type
  TMayo = class(TFilling)
  protected
    FBread: TBread;
    FPrice: Double;
    function getName: string; override;
    function getPrice: Double; override;
    function getSelfPrice: Double; override;
  public
    constructor Create(ABread: TBread; APrice: Double);
    destructor Destroy; override;
    property Name: string read getName;
    property Price: Double read getPrice;
    property SelfPrice: Double read getSelfPrice;
  end;

implementation

{ TSalami }

constructor TSalami.Create(ABread: TBread; APrice: Double);
begin
  FBread := ABread;
  FPrice := APrice;
  inherited Create;
end;

destructor TSalami.Destroy;
begin
  FreeAndNil(FBread);
  inherited;
end;

function TSalami.getName: string;
begin
  Result := FBread.Name + ', Salami';
end;

function TSalami.getPrice: Double;
begin
  Result := FPrice + FBread.Price;
end;

function TSalami.getSelfPrice: Double;
begin
  Result := FPrice;
end;

{ TPepperoni }

constructor TPepperoni.Create(ABread: TBread; APrice: Double);
begin
  FBread := ABread;
  FPrice := APrice;
  inherited Create;
end;

destructor TPepperoni.Destroy;
begin
  FreeAndNil(FBread);
  inherited;
end;

function TPepperoni.getName: string;
begin
  Result := FBread.Name + ', Pepperoni';
end;

function TPepperoni.getPrice: Double;
begin
  Result := FPrice + FBread.Price;
end;

function TPepperoni.getSelfPrice: Double;
begin
  Result := FPrice;
end;

{ TMayo }

constructor TMayo.Create(ABread: TBread; APrice: Double);
begin
  FBread := ABread;
  FPrice := APrice;
  inherited Create;
end;

destructor TMayo.Destroy;
begin
  FreeAndNil(FBread);
  inherited;
end;

function TMayo.getName: string;
begin
  Result := FBread.Name + ', Mayo';
end;

function TMayo.getPrice: Double;
begin
  Result := FPrice + FBread.Price;
end;

function TMayo.getSelfPrice: Double;
begin
  Result := FPrice;
end;

end.
