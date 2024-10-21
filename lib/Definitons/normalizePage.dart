int normalizePageIndex(int pageIndex) {
  while (pageIndex >= 8) {
    pageIndex = (pageIndex) % 8;
  }
  return pageIndex;
}
