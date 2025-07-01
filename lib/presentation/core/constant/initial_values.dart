class InitialValues {

  Map<String, String> vendorInit(String budget) {
    return {
      'budget': 'Rp $budget',
      'unusedBudget': 'Rp 0',
      'overBudget': 'Rp 0',
      'paid': 'Rp 0',
      'unpaid': 'Rp 0',
      'total': 'Rp 0',
    };
  }

  Map<String, String> invitationInit() {
    return {
      'mails': '0 Mail',
      'peoples': '0 Peoples',
      'confirmed': '0',
      'unconfirmed': '0',
    };
  }

  Map<String, String> rundownInit() {
    return {
      'sessions': '0 Sessions',
      'totalHours': '0 Hr 0 Min',
      'totalDays': '0 Days',
      'startAt': '-',
      'endAt': '-',
    };
  }

}
