create or replace PACKAGE BODY STRIPE_API AS

    g_secret_token varchar2(100);
    
    procedure set_secret(
        p_secret in varchar2
    )
    as
    begin
        g_secret_token := p_secret;
    end set_secret;

    procedure charge_card (
        p_amount in NUMBER
      , p_currency in varchar2 default 'aud'
      , p_source in varchar2
      , p_description in varchar2
    ) 
    as
    
        l_charge_resp CLOB;
    
    begin
        
        l_charge_resp := 
            apex_web_service.make_rest_request(
                p_url => 'https://api.stripe.com/v1/charges'
              , p_http_method => 'POST'  
              , p_wallet_path => 'file:/u01/app/oracle/product/11.2.0/xe/wallets/stripe'
              , p_wallet_pwd => 'thewalletpassword' 
              , p_username => g_secret_token
              , p_parm_name => apex_util.string_to_table('amount:currency:source:description')
              , p_parm_value => apex_util.string_to_table(p_amount ||':'||p_currency||':'||p_source||':'||p_description)
            );
        
        dbms_output.put_line(l_charge_resp);    
        
    end charge_card;

END STRIPE_API;
