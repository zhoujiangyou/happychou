<<<<<<< HEAD
<?php

/* vim: set shiftwidth=2 expandtab softtabstop=2: */

namespace Boris;

/**
 * Passes values through var_export() to inspect them.
 */
class ExportInspector implements Inspector {
  public function inspect($variable) {
    return sprintf(" → %s", var_export($variable, true));
  }
}
=======
<?php

/* vim: set shiftwidth=2 expandtab softtabstop=2: */

namespace Boris;

/**
 * Passes values through var_export() to inspect them.
 */
class ExportInspector implements Inspector {
  public function inspect($variable) {
    return sprintf(" → %s", var_export($variable, true));
  }
}
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
