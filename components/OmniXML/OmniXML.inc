{ $OmniXML: OmniXML/OmniXML.inc,v 1.2 2005/06/02 10:21:29 mremec Exp $ }

{$IFDEF CONDITIONALEXPRESSIONS}
  {$IF Declared(RTLVersion) and (RTLVersion >= 14)}
    {$DEFINE HAS_UNIT_VARIANTS}
  {$IFEND}
{$ENDIF}

{$I OmniXML_JEDI.inc}
