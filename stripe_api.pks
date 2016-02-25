create or replace package STRIPE_API
as

    procedure set_secret(
        p_secret in varchar2
    );

    procedure charge_card (
        p_amount in NUMBER
      , p_currency in varchar2 default 'aud'
      , p_source in varchar2
      , p_description in varchar2
    );

end STRIPE_API;
