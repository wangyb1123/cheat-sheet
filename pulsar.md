### Pulsar Security

## Authentication
# Client side                                               Server side
- Authentication -> AuthenticationDataProvider             -> AuthenticationProvider
- AuthenenticationToken -> AuthenticationDataToken         -> AuthenticationProviderToken
- AuthenticaitonTls > AuthenticationDataToken              -> AuthenticaitonProviderTls

ClientCnx.channelActive() -> ClientCnx.newConnectCommand() -> 
1. AuthenticationDataProvider = Authentication.getAuthData(); 
2. AuthenticationDataProvider.authenticate();
3. Commands.newConnect()

Authentication happens when a new connenction from client
ServerCnx.handleConnect(CommandConnect)
  getOriginalPrincipal
    authenticationService.authenticate(authenticationDataCommand, authMethod)
      AuthenticationProviderToken.authenticate(authenticationDataSource)   --> parse jwt token, get user identity
  authenticationProviderToken.newAuthState()   --> crate an authentication state with user identity


Authorization on subscription
ServerCnx.handleSubscribe(CommandSubscribe)
  AuthorizationService.canConsumeAsync
    AuthorizationProvider.canConsumeAsync

Authorization on producer
ServerCnx.handleSubscribe(CommandSubscribe)
  AuthorizationService.canProduceAsync
    AuthorizationProvider.canProduceAsync

Authorization on policy update
BrokerService.onUpdate()
  PersistentTopic/NonPersistentTopic.onPoliciesUpdate
    Consumer.checkPermissions
      AuthorizationService.canConsume
        AuthorizationService.canConsumeAsync
          AuthorizationProvider.canConsumeAsync

