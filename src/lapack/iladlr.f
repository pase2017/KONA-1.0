      INTEGER FUNCTION ILADLR(M, N, A, LDA)
      IMPLICIT NONE
!
!  -- LAPACK auxiliary routine (version 3.2) --
!     Univ. of Tennessee, Univ. of California Berkeley and NAG Ltd..
!     December 2007
!
!     .. Scalar Arguments ..
      INTEGER            M, N, LDA
!     ..
!     .. Array Arguments ..
      DOUBLE PRECISION   A( LDA, * )
!     ..
!
!  Purpose
!  =======
!
!  ILADLR scans A for its last non-zero row.
!
!  Arguments
!  =========
!
!  M       (input) INTEGER
!          The number of rows of the matrix A.
!
!  N       (input) INTEGER
!          The number of columns of the matrix A.
!
!  A       (input) DOUBLE PRECISION array, dimension (LDA,N)
!          The m by n matrix A.
!
!  LDA     (input) INTEGER
!          The leading dimension of the array A. LDA >= max(1,M).
!
!  =====================================================================
!
!     .. Parameters ..
      DOUBLE PRECISION ZERO
      PARAMETER ( ZERO = 0.0D+0 )
!     ..
!     .. Local Scalars ..
      INTEGER I, J
!     ..
!     .. Executable Statements ..
!
!     Quick test for the common case where one corner is non-zero.
      IF( M.EQ.0 .OR. A(M, 1).NE.ZERO .OR. A(M, N).NE.ZERO ) THEN
         ILADLR = M
      ELSE
!     Scan up each column tracking the last zero row seen.
         ILADLR = 0
         DO J = 1, N
            DO I = M, 1, -1
               IF( A(I, J).NE.ZERO ) GOTO 10
            END DO
   10       CONTINUE
            ILADLR = MAX( ILADLR, I )
         END DO
      END IF
      RETURN
      END
