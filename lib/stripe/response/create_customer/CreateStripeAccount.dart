class AutoGenerate {
  AutoGenerate({
    required this.account,
    required this.link,
  });
  late final Account account;
  late final Link link;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    account = Account.fromJson(json['account']);
    link = Link.fromJson(json['link']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['account'] = account.toJson();
    _data['link'] = link.toJson();
    return _data;
  }
}

class Account {
  Account({
    required this.id,
    required this.object,
    required this.businessProfile,
    this.businessType,
    required this.capabilities,
    required this.chargesEnabled,
    required this.country,
    required this.created,
    required this.defaultCurrency,
    required this.detailsSubmitted,
    this.email,
    required this.externalAccounts,
    required this.futureRequirements,
    required this.loginLinks,
    required this.metadata,
    required this.payoutsEnabled,
    required this.requirements,
    required this.settings,
    required this.tosAcceptance,
    required this.type,
  });
  late final String id;
  late final String object;
  late final BusinessProfile businessProfile;
  late final Null businessType;
  late final Capabilities capabilities;
  late final bool chargesEnabled;
  late final String country;
  late final int created;
  late final String defaultCurrency;
  late final bool detailsSubmitted;
  late final Null email;
  late final ExternalAccounts externalAccounts;
  late final FutureRequirements futureRequirements;
  late final LoginLinks loginLinks;
  late final Metadata metadata;
  late final bool payoutsEnabled;
  late final Requirements requirements;
  late final Settings settings;
  late final TosAcceptance tosAcceptance;
  late final String type;

  Account.fromJson(Map<String, dynamic> json){
    id = json['id'];
    object = json['object'];
    businessProfile = BusinessProfile.fromJson(json['business_profile']);
    businessType = null;
    capabilities = Capabilities.fromJson(json['capabilities']);
    chargesEnabled = json['charges_enabled'];
    country = json['country'];
    created = json['created'];
    defaultCurrency = json['default_currency'];
    detailsSubmitted = json['details_submitted'];
    email = null;
    externalAccounts = ExternalAccounts.fromJson(json['external_accounts']);
    futureRequirements = FutureRequirements.fromJson(json['future_requirements']);
    loginLinks = LoginLinks.fromJson(json['login_links']);
    metadata = Metadata.fromJson(json['metadata']);
    payoutsEnabled = json['payouts_enabled'];
    requirements = Requirements.fromJson(json['requirements']);
    settings = Settings.fromJson(json['settings']);
    tosAcceptance = TosAcceptance.fromJson(json['tos_acceptance']);
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['object'] = object;
    _data['business_profile'] = businessProfile.toJson();
    _data['business_type'] = businessType;
    _data['capabilities'] = capabilities.toJson();
    _data['charges_enabled'] = chargesEnabled;
    _data['country'] = country;
    _data['created'] = created;
    _data['default_currency'] = defaultCurrency;
    _data['details_submitted'] = detailsSubmitted;
    _data['email'] = email;
    _data['external_accounts'] = externalAccounts.toJson();
    _data['future_requirements'] = futureRequirements.toJson();
    _data['login_links'] = loginLinks.toJson();
    _data['metadata'] = metadata.toJson();
    _data['payouts_enabled'] = payoutsEnabled;
    _data['requirements'] = requirements.toJson();
    _data['settings'] = settings.toJson();
    _data['tos_acceptance'] = tosAcceptance.toJson();
    _data['type'] = type;
    return _data;
  }
}

class BusinessProfile {
  BusinessProfile({
    this.mcc,
    this.name,
    this.productDescription,
    this.supportAddress,
    this.supportEmail,
    this.supportPhone,
    this.supportUrl,
    this.url,
  });
  late final Null mcc;
  late final Null name;
  late final Null productDescription;
  late final Null supportAddress;
  late final Null supportEmail;
  late final Null supportPhone;
  late final Null supportUrl;
  late final Null url;

  BusinessProfile.fromJson(Map<String, dynamic> json){
    mcc = null;
    name = null;
    productDescription = null;
    supportAddress = null;
    supportEmail = null;
    supportPhone = null;
    supportUrl = null;
    url = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mcc'] = mcc;
    _data['name'] = name;
    _data['product_description'] = productDescription;
    _data['support_address'] = supportAddress;
    _data['support_email'] = supportEmail;
    _data['support_phone'] = supportPhone;
    _data['support_url'] = supportUrl;
    _data['url'] = url;
    return _data;
  }
}

class Capabilities {
  Capabilities();

  Capabilities.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class ExternalAccounts {
  ExternalAccounts({
    required this.object,
    required this.data,
    required this.hasMore,
    required this.totalCount,
    required this.url,
  });
  late final String object;
  late final List<dynamic> data;
  late final bool hasMore;
  late final int totalCount;
  late final String url;

  ExternalAccounts.fromJson(Map<String, dynamic> json){
    object = json['object'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
    hasMore = json['has_more'];
    totalCount = json['total_count'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['object'] = object;
    _data['data'] = data;
    _data['has_more'] = hasMore;
    _data['total_count'] = totalCount;
    _data['url'] = url;
    return _data;
  }
}

class FutureRequirements {
  FutureRequirements({
    required this.alternatives,
    this.currentDeadline,
    required this.currentlyDue,
    this.disabledReason,
    required this.errors,
    required this.eventuallyDue,
    required this.pastDue,
    required this.pendingVerification,
  });
  late final List<dynamic> alternatives;
  late final Null currentDeadline;
  late final List<dynamic> currentlyDue;
  late final Null disabledReason;
  late final List<dynamic> errors;
  late final List<dynamic> eventuallyDue;
  late final List<dynamic> pastDue;
  late final List<dynamic> pendingVerification;

  FutureRequirements.fromJson(Map<String, dynamic> json){
    alternatives = List.castFrom<dynamic, dynamic>(json['alternatives']);
    currentDeadline = null;
    currentlyDue = List.castFrom<dynamic, dynamic>(json['currently_due']);
    disabledReason = null;
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    eventuallyDue = List.castFrom<dynamic, dynamic>(json['eventually_due']);
    pastDue = List.castFrom<dynamic, dynamic>(json['past_due']);
    pendingVerification = List.castFrom<dynamic, dynamic>(json['pending_verification']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['alternatives'] = alternatives;
    _data['current_deadline'] = currentDeadline;
    _data['currently_due'] = currentlyDue;
    _data['disabled_reason'] = disabledReason;
    _data['errors'] = errors;
    _data['eventually_due'] = eventuallyDue;
    _data['past_due'] = pastDue;
    _data['pending_verification'] = pendingVerification;
    return _data;
  }
}

class LoginLinks {
  LoginLinks({
    required this.object,
    required this.totalCount,
    required this.hasMore,
    required this.url,
    required this.data,
  });
  late final String object;
  late final int totalCount;
  late final bool hasMore;
  late final String url;
  late final List<dynamic> data;

  LoginLinks.fromJson(Map<String, dynamic> json){
    object = json['object'];
    totalCount = json['total_count'];
    hasMore = json['has_more'];
    url = json['url'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['object'] = object;
    _data['total_count'] = totalCount;
    _data['has_more'] = hasMore;
    _data['url'] = url;
    _data['data'] = data;
    return _data;
  }
}

class Metadata {
  Metadata();

  Metadata.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Requirements {
  Requirements({
    required this.alternatives,
    this.currentDeadline,
    required this.currentlyDue,
    required this.disabledReason,
    required this.errors,
    required this.eventuallyDue,
    required this.pastDue,
    required this.pendingVerification,
  });
  late final List<dynamic> alternatives;
  late final Null currentDeadline;
  late final List<String> currentlyDue;
  late final String disabledReason;
  late final List<dynamic> errors;
  late final List<String> eventuallyDue;
  late final List<String> pastDue;
  late final List<dynamic> pendingVerification;

  Requirements.fromJson(Map<String, dynamic> json){
    alternatives = List.castFrom<dynamic, dynamic>(json['alternatives']);
    currentDeadline = null;
    currentlyDue = List.castFrom<dynamic, String>(json['currently_due']);
    disabledReason = json['disabled_reason'];
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    eventuallyDue = List.castFrom<dynamic, String>(json['eventually_due']);
    pastDue = List.castFrom<dynamic, String>(json['past_due']);
    pendingVerification = List.castFrom<dynamic, dynamic>(json['pending_verification']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['alternatives'] = alternatives;
    _data['current_deadline'] = currentDeadline;
    _data['currently_due'] = currentlyDue;
    _data['disabled_reason'] = disabledReason;
    _data['errors'] = errors;
    _data['eventually_due'] = eventuallyDue;
    _data['past_due'] = pastDue;
    _data['pending_verification'] = pendingVerification;
    return _data;
  }
}

class Settings {
  Settings({
    required this.bacsDebitPayments,
    required this.branding,
    required this.cardIssuing,
    required this.cardPayments,
    required this.dashboard,
    required this.payments,
    required this.payouts,
    required this.sepaDebitPayments,
  });
  late final BacsDebitPayments bacsDebitPayments;
  late final Branding branding;
  late final CardIssuing cardIssuing;
  late final CardPayments cardPayments;
  late final Dashboard dashboard;
  late final Payments payments;
  late final Payouts payouts;
  late final SepaDebitPayments sepaDebitPayments;

  Settings.fromJson(Map<String, dynamic> json){
    bacsDebitPayments = BacsDebitPayments.fromJson(json['bacs_debit_payments']);
    branding = Branding.fromJson(json['branding']);
    cardIssuing = CardIssuing.fromJson(json['card_issuing']);
    cardPayments = CardPayments.fromJson(json['card_payments']);
    dashboard = Dashboard.fromJson(json['dashboard']);
    payments = Payments.fromJson(json['payments']);
    payouts = Payouts.fromJson(json['payouts']);
    sepaDebitPayments = SepaDebitPayments.fromJson(json['sepa_debit_payments']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bacs_debit_payments'] = bacsDebitPayments.toJson();
    _data['branding'] = branding.toJson();
    _data['card_issuing'] = cardIssuing.toJson();
    _data['card_payments'] = cardPayments.toJson();
    _data['dashboard'] = dashboard.toJson();
    _data['payments'] = payments.toJson();
    _data['payouts'] = payouts.toJson();
    _data['sepa_debit_payments'] = sepaDebitPayments.toJson();
    return _data;
  }
}

class BacsDebitPayments {
  BacsDebitPayments();

  BacsDebitPayments.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Branding {
  Branding({
    this.icon,
    this.logo,
    this.primaryColor,
    this.secondaryColor,
  });
  late final Null icon;
  late final Null logo;
  late final Null primaryColor;
  late final Null secondaryColor;

  Branding.fromJson(Map<String, dynamic> json){
    icon = null;
    logo = null;
    primaryColor = null;
    secondaryColor = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['icon'] = icon;
    _data['logo'] = logo;
    _data['primary_color'] = primaryColor;
    _data['secondary_color'] = secondaryColor;
    return _data;
  }
}

class CardIssuing {
  CardIssuing({
    required this.tosAcceptance,
  });
  late final TosAcceptance tosAcceptance;

  CardIssuing.fromJson(Map<String, dynamic> json){
    tosAcceptance = TosAcceptance.fromJson(json['tos_acceptance']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tos_acceptance'] = tosAcceptance.toJson();
    return _data;
  }
}

class TosAcceptance {
  TosAcceptance({
    this.date,
    this.ip,
  });
  late final Null date;
  late final Null ip;

  TosAcceptance.fromJson(Map<String, dynamic> json){
    date = null;
    ip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['ip'] = ip;
    return _data;
  }
}

class CardPayments {
  CardPayments({
    required this.declineOn,
    this.statementDescriptorPrefix,
  });
  late final DeclineOn declineOn;
  late final Null statementDescriptorPrefix;

  CardPayments.fromJson(Map<String, dynamic> json){
    declineOn = DeclineOn.fromJson(json['decline_on']);
    statementDescriptorPrefix = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['decline_on'] = declineOn.toJson();
    _data['statement_descriptor_prefix'] = statementDescriptorPrefix;
    return _data;
  }
}

class DeclineOn {
  DeclineOn({
    required this.avsFailure,
    required this.cvcFailure,
  });
  late final bool avsFailure;
  late final bool cvcFailure;

  DeclineOn.fromJson(Map<String, dynamic> json){
    avsFailure = json['avs_failure'];
    cvcFailure = json['cvc_failure'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['avs_failure'] = avsFailure;
    _data['cvc_failure'] = cvcFailure;
    return _data;
  }
}

class Dashboard {
  Dashboard({
    this.displayName,
    required this.timezone,
  });
  late final Null displayName;
  late final String timezone;

  Dashboard.fromJson(Map<String, dynamic> json){
    displayName = null;
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['display_name'] = displayName;
    _data['timezone'] = timezone;
    return _data;
  }
}

class Payments {
  Payments({
    this.statementDescriptor,
    this.statementDescriptorKana,
    this.statementDescriptorKanji,
  });
  late final Null statementDescriptor;
  late final Null statementDescriptorKana;
  late final Null statementDescriptorKanji;

  Payments.fromJson(Map<String, dynamic> json){
    statementDescriptor = null;
    statementDescriptorKana = null;
    statementDescriptorKanji = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statement_descriptor'] = statementDescriptor;
    _data['statement_descriptor_kana'] = statementDescriptorKana;
    _data['statement_descriptor_kanji'] = statementDescriptorKanji;
    return _data;
  }
}

class Payouts {
  Payouts({
    required this.debitNegativeBalances,
    required this.schedule,
    this.statementDescriptor,
  });
  late final bool debitNegativeBalances;
  late final Schedule schedule;
  late final Null statementDescriptor;

  Payouts.fromJson(Map<String, dynamic> json){
    debitNegativeBalances = json['debit_negative_balances'];
    schedule = Schedule.fromJson(json['schedule']);
    statementDescriptor = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['debit_negative_balances'] = debitNegativeBalances;
    _data['schedule'] = schedule.toJson();
    _data['statement_descriptor'] = statementDescriptor;
    return _data;
  }
}

class Schedule {
  Schedule({
    required this.delayDays,
    required this.interval,
  });
  late final int delayDays;
  late final String interval;

  Schedule.fromJson(Map<String, dynamic> json){
    delayDays = json['delay_days'];
    interval = json['interval'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['delay_days'] = delayDays;
    _data['interval'] = interval;
    return _data;
  }
}

class SepaDebitPayments {
  SepaDebitPayments();

  SepaDebitPayments.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Link {
  Link({
    required this.object,
    required this.created,
    required this.expiresAt,
    required this.url,
  });
  late final String object;
  late final int created;
  late final int expiresAt;
  late final String url;

  Link.fromJson(Map<String, dynamic> json){
    object = json['object'];
    created = json['created'];
    expiresAt = json['expires_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['object'] = object;
    _data['created'] = created;
    _data['expires_at'] = expiresAt;
    _data['url'] = url;
    return _data;
  }
}