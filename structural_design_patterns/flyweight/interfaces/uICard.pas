unit uICard;

interface

type
  ICard = interface
    procedure setReaderName(const Name: string);
    procedure Export;
    property ReaderName: string write setReaderName;
  end;

implementation

end.
